<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Department;
use AppBundle\Entity\Stuff;
use Doctrine\ORM\QueryBuilder;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {
        /** @var QueryBuilder $qb */
        $qb = $this->getDoctrine()->getManager()->createQueryBuilder('d');

        $q = $qb->select('d.id as dId, d.name as dName, s.id as sId, s.firstName as sFName, s.lastName as sLName')
            ->from(Department::class, 'd')
            ->leftJoin('d.stuff', 's')
            ->getQuery()
        ;

        $table = [];
        $stuffMap = [];

        foreach ($q->getArrayResult() as $res) {
            $dId = $res['dId'];
            $sId = $res['sId'];

            if (!isset($table[$dId])) {
                $table[$dId] = [
                    'department' => ['name' => $res['dName']],
                    'stuffIds'    => []
                ];
            }

            if (!isset($stuffMap[$sId])) {
                $stuffMap[$sId] = ['lastName' => $res['sLName'], 'firstName' => $res['sFName']];
            }

            $table[$dId]['stuffIds'][] = $sId;
        }


        return $this->render('default/index.html.twig', [
            'stuffMap' => $stuffMap,
            'table' => $table,
        ]);
    }
}
