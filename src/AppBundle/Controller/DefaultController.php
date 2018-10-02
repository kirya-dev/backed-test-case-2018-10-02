<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Department;
use AppBundle\Entity\Stuff;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {
        $stuffMap = [];

        /** @var Stuff[] $stuffs */
        $stuffs = $this->getDoctrine()->getRepository(Stuff::class)->findAll();
        foreach ($stuffs as $stuff) {
            $stuffMap[$stuff->getId()] = $stuff;
        }


        $table = [];

        /** @var Department[] $departments */
        $departments = $this->getDoctrine()->getRepository(Department::class)->findAll();

        foreach ($departments as $department) {
            $stuffIds = [];
            foreach ($department->getStuff() as $stuff) {
                $stuffIds[] = $stuff->getId();
            }

            $table[] = [
                'department' => $department,
                'stuffIds' => $stuffIds,
            ];
        }

        return $this->render('default/index.html.twig', [
            'stuffMap' => $stuffMap,
            'table' => $table,
        ]);
    }
}
