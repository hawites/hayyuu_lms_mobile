
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/courses.dart';
import 'common_functions.dart';

AlertDialog buildPopupDialog(BuildContext context, items) {
  return AlertDialog(
    title: const Text('Notifying'),
    content: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Do you wish to remove this course?'),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'No',
          style: TextStyle(color: Colors.red),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          Provider.of<Courses>(context, listen: false)
              .toggleWishlist(items, true)
              .then((_) =>
                  CommonFunctions.showSuccessToast('Removed from wishlist.'));
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'Yes',
          style: TextStyle(color: Colors.green),
        ),
      ),
    ],
  );
}

AlertDialog buildPopupDialogWishList(BuildContext context, isWishlisted, id, msg) {
  return AlertDialog(
    title: const Text('Notifying'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        msg
            ? const Text('Do you want remove it?')
            : const Text('Do you want to add it?'),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'No',
          style: TextStyle(color: Colors.red),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          var msg = isWishlisted ? 'Remove from Wishlist' : 'Added to Wishlist';
          CommonFunctions.showSuccessToast(msg);
          Provider.of<Courses>(context, listen: false).toggleWishlist(id, false);
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'Yes',
          style: TextStyle(color: Colors.green),
        ),
      ),
    ],
  );
}
