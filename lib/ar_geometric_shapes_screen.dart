import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArGeometricShapesScreen extends StatefulWidget {
  const ArGeometricShapesScreen({super.key});

  @override
  State<ArGeometricShapesScreen> createState() => _ArGeometricShapesScreenState();
}

class _ArGeometricShapesScreenState extends State<ArGeometricShapesScreen> {

  ArCoreController? coreController;

  argumentedRealityViewCreated(ArCoreController controller)
  {
    coreController = controller;

    displayCube(coreController!);
    displayCylinder(coreController!);

  }

  displayCube(ArCoreController controller)
  {
    final materials = ArCoreMaterial(
      color: Colors.blueAccent,
      metallic: 2
    );

    final cube = ArCoreCube(size: vector64.Vector3(0.5,0.5,0.5), materials: [materials]);

    final node = ArCoreNode(
      shape: cube,
      position: vector64.Vector3(-0.5, 0.5, -3.5)
    );

    coreController!.addArCoreNode(node);
  }

  displayCylinder(ArCoreController controller)
  {
    final materials = ArCoreMaterial(
        color: Colors.purple,
        reflectance: 2
    );

    final cylinder = ArCoreCylinder( materials: [materials], radius: 0.5, height: 0.7);

    final node = ArCoreNode(
        shape: cylinder,
        position: vector64.Vector3(0.0, -0.5, -2.0)
    );

    coreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Geomatrics Shapes'
        ),
        centerTitle: true,
      ),
      body: ArCoreView(
        onArCoreViewCreated: argumentedRealityViewCreated,
      ),
    );
  }
}
