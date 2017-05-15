package com.shop.database.services;

import com.shop.database.entities.Object;
import com.shop.database.entities.ObjectType;

import java.util.List;

/**
 * Created by said on 06.05.2017.
 */
public interface ObjectService {
    void save(Object object);
    Object findById(int id);
    List<Object> findByName(String name);
    List<Object> findByObjectType(ObjectType objectType);
}
