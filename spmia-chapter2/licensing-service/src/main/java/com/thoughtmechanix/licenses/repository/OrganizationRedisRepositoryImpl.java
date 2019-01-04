package com.thoughtmechanix.licenses.repository;

import com.thoughtmechanix.licenses.model.Organization;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;

@Repository
public class OrganizationRedisRepositoryImpl implements OrganizationRedisRepository {

    private static final Logger logger = LoggerFactory.getLogger(OrganizationRedisRepositoryImpl.class);

    private static final String HASH_NAME ="organization";

    private RedisTemplate<String, Organization> redisTemplate;
    //private RedisService redisService;
    private HashOperations hashOperations;

    public OrganizationRedisRepositoryImpl(){
        super();
    }

    @Autowired
    private OrganizationRedisRepositoryImpl(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
        //this.redisService = redisService;
    }

    @PostConstruct
    private void init() {
        hashOperations = redisTemplate.opsForHash();
    }


    @Override
    public void saveOrganization(Organization org) {

        logger.info("saveOrganization called with OrgId as {} and org contact name is {}", org.getId(), org.getContactName());

        hashOperations.put(HASH_NAME, org.getId(), org);
        //redisService.add(org.getId(), org);
    }

    @Override
    public void updateOrganization(Organization org) {
        hashOperations.put(HASH_NAME, org.getId(), org);
    }

    @Override
    public void deleteOrganization(String organizationId) {

        logger.info("deleteOrganization is called to delete org with ID of {}", organizationId);

        hashOperations.delete(HASH_NAME, organizationId);
    }

    @Override
    public Organization findOrganization(String organizationId) {

        logger.info("findOrganization() called on orgId {}", organizationId);

        return (Organization) hashOperations.get(HASH_NAME, organizationId);
    }
}
