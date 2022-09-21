String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays > 1) {
    return '${diff.inDays} days ago';
  } else if (diff.inDays == 1) {
    return '1 day ago';
  } else if (diff.inHours > 1) {
    return '${diff.inHours} hours ago';
  } else if (diff.inHours == 1) {
    return '${diff.inHours} hour ago';
  } else if (diff.inMinutes == 1) {
    return '${diff.inMinutes} min ago';
  } else if (diff.inMinutes > 1) {
    return '${diff.inMinutes} min ago';
  } else if (diff.inSeconds > 1) {
    return '${diff.inSeconds} sec ago';
  } else {
    return 'Just now';
  }
}
