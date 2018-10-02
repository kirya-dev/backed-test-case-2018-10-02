<?php

namespace AppBundle\Admin;

use AppBundle\Entity\Stuff;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class StuffAdmin extends AbstractAdmin
{
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('firstName')
            ->add('lastName')
            ->add('middleName')
            ->add('sex')
            ->add('salary')
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->add('firstName')
            ->add('lastName')
            ->add('middleName')
            ->add('sex')
            ->add('salary')
            ->add('createdAt')
            ->add('updatedAt')
            ->add('_action', null, [
                'actions' => [
                    'show' => [],
                    'edit' => [],
                    'delete' => [],
                ],
            ])
        ;
    }

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('firstName')
            ->add('lastName')
            ->add('middleName')
            ->add('sex', 'choice', ['choices' => Stuff::getSexChoices()])
            ->add('salary')
            ->add('department')
        ;
    }

    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('firstName')
            ->add('lastName')
            ->add('middleName')
            ->add('sex')
            ->add('salary')
            ->add('department')
            ->add('createdAt')
            ->add('updatedAt')
        ;
    }
}
