package com.shop.database.services;

import com.shop.database.entities.Attribute;
import com.shop.database.entities.Parameter;

import java.util.List;

/**
 * Created by said on 07.05.2017.
 */
public interface ParameterService {
    void save(Parameter parameter);
    List<Parameter> findByObject(Object object);
    List<Parameter> findByAttribute(Attribute attribute);
    List<Parameter> findByValue(String value);
}
