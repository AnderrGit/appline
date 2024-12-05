import 'package:appline/app/core/widgets/vertical_sizedbox_spacing.dart';
import 'package:appline/app/modules/home/presentation/controllers/orders_controller.dart';
import 'package:appline/app/modules/home/presentation/views/home/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appline/app/core/design/constants.dart';

class HomeScreen extends GetView<OrdersController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: const AppbARR(),
      endDrawer: const Drawerrr(),
      body: Stack(
        children: [
          Obx(() {
            if (controller.availableOrders.isEmpty) {
              return Center(
                child: Text(
                  'No hay órdenes disponibles',
                  style: AppTextStyles.secondaryTextStyle,
                ),
              );
            }
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  const VerticalSizedboxSpacing(
                height: AppDimensions.horizontalPadding,
              ),
              padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
              itemCount: controller.availableOrders.length,
              itemBuilder: (context, index) {
                final order = controller.availableOrders[index];
                return OrderTile(
                  order: order,
                  onAccept: () async => await controller.acceptOrder(order),
                  onReject: () async => await controller.declineOrder(order),
                  onTap: () => controller.viewOrderDetails(order),
                );
              },
            );
          }),
          Obx(() {
            if (controller.isLoading.value) {
              return Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}

class AppbARR extends StatelessWidget implements PreferredSizeWidget {
  const AppbARR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Órdenes Disponibles',
        style: AppTextStyles.appBarTextStyle,
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: AppColors.whiteColor),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Drawerrr extends StatelessWidget {
  const Drawerrr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primaryColor),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bienvenido, Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historial de Órdenes'),
            onTap: () {
              Get.toNamed('/order-history');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
