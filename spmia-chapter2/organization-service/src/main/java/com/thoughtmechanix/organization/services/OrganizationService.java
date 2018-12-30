package com.thoughtmechanix.organization.services;

import com.thoughtmechanix.organization.controllers.OrganizationServiceController;
import com.thoughtmechanix.organization.model.Organization;
import com.thoughtmechanix.organization.repository.OrganizationRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class OrganizationService {
    @Autowired
    private OrganizationRepository orgRepository;

    private static final Logger logger = LoggerFactory.getLogger(OrganizationService.class);


    public Organization getOrg(String organizationId) {

        logger.info("OriganizationService getOrg called with ID: {}", organizationId);
        return orgRepository.findById(organizationId);
    }

    public void saveOrg(Organization org){
        org.setId( UUID.randomUUID().toString());

        orgRepository.save(org);
    }

    public void updateOrg(Organization org){
        orgRepository.save(org);

    }

    public void deleteOrg(String orgId){
        orgRepository.delete( orgId);
    }
}
