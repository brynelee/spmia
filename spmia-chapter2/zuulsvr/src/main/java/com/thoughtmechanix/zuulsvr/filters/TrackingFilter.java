package com.thoughtmechanix.zuulsvr.filters;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.thoughtmechanix.zuulsvr.config.ServiceConfig;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TrackingFilter extends ZuulFilter{
    private static final int      FILTER_ORDER =  1;
    private static final boolean  SHOULD_FILTER=true;
    private static final Logger logger = LoggerFactory.getLogger(TrackingFilter.class);

    @Autowired
    FilterUtils filterUtils;

    @Autowired
    private ServiceConfig serviceConfig;

    @Override
    public String filterType() {
        return FilterUtils.PRE_FILTER_TYPE;
    }

    @Override
    public int filterOrder() {
        return FILTER_ORDER;
    }

    public boolean shouldFilter() {
        return SHOULD_FILTER;
    }

    private boolean isCorrelationIdPresent(){
        if (filterUtils.getCorrelationId() !=null){
            return true;
        }

        return false;
    }

    private String generateCorrelationId(){
        return java.util.UUID.randomUUID().toString();
    }

    private String getOrganizationId(){

        String result="";
        if (filterUtils.getAuthToken()!=null){

            String authToken = filterUtils.getAuthToken().replace("Bearer ","");

            logger.info("the token got is: {}", authToken);

            try {
                Claims claims = Jwts.parser()
                        .setSigningKey(serviceConfig.getJwtSigningKey().getBytes("UTF-8"))
                        .parseClaimsJws(authToken).getBody();
                result = (String) claims.get("organizationId");
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }

        logger.info("getOrganizationId is called and the result is: {}", result);

        return result;
    }

    public Object run() {

        if (isCorrelationIdPresent()) {
            logger.info("tmx-correlation-id found in tracking filter: {}. ", filterUtils.getCorrelationId());
        }
        else{
            filterUtils.setCorrelationId(generateCorrelationId());
            logger.info("tmx-correlation-id generated in tracking filter: {}.", filterUtils.getCorrelationId());
        }

        RequestContext ctx = RequestContext.getCurrentContext();
        logger.info("Processing incoming request for {}.",  ctx.getRequest().getRequestURI());

        System.out.println("The organization id from the token is : " + getOrganizationId());
        filterUtils.setOrgId(getOrganizationId());

        return null;
    }
}