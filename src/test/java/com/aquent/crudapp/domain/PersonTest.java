package com.aquent.crudapp.domain;

import com.aquent.crudapp.service.DefaultPersonService;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.Test;
import org.junit.runner.RunWith;
import java.util.List;

@RunWith(Arquillian.class)
public class PersonTest {
    @Deployment
    public static JavaArchive createDeployment() {
        return ShrinkWrap.create(JavaArchive.class)
                .addClass(Person.class)
                .addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml");
    }

    @Test
    public void testInput() {
        Person person = new Person();
        person.setFirstName("");
        DefaultPersonService defaultPersonService = new DefaultPersonService();
        List<String> validation =defaultPersonService.validatePerson(person);
        assert validation.size() > 1;
    }

}
