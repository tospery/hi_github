import 'package:hi_flutter/hi_flutter.dart';

import 'plan.dart';

class User extends Equatable {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final dynamic hireable;
  final String? bio;
  final dynamic twitterUsername;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final String? createdAt;
  final String? updatedAt;
  final int? privateGists;
  final int? totalPrivateRepos;
  final int? ownedPrivateRepos;
  final int? diskUsage;
  final int? collaborators;
  final bool? twoFactorAuthentication;
  final Plan? plan;

  const User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.privateGists,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
    this.diskUsage,
    this.collaborators,
    this.twoFactorAuthentication,
    this.plan,
  });

  bool get isValid => id != 0;
  int get repositoryCount => (publicRepos ?? 0) + (totalPrivateRepos ?? 0);
  String get dynamicCardUrlString => 'https://ghchart.rshah.org/1CA035/$login';

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json['login'] as String?,
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        gravatarId: json['gravatar_id'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        followersUrl: json['followers_url'] as String?,
        followingUrl: json['following_url'] as String?,
        gistsUrl: json['gists_url'] as String?,
        starredUrl: json['starred_url'] as String?,
        subscriptionsUrl: json['subscriptions_url'] as String?,
        organizationsUrl: json['organizations_url'] as String?,
        reposUrl: json['repos_url'] as String?,
        eventsUrl: json['events_url'] as String?,
        receivedEventsUrl: json['received_events_url'] as String?,
        type: json['type'] as String?,
        siteAdmin: json['site_admin'] as bool?,
        name: json['name'] as String?,
        company: json['company'] as String?,
        blog: json['blog'] as String?,
        location: json['location'] as String?,
        email: json['email'] as String?,
        hireable: json['hireable'] as dynamic,
        bio: json['bio'] as String?,
        twitterUsername: json['twitter_username'] as dynamic,
        publicRepos: json['public_repos'] as int?,
        publicGists: json['public_gists'] as int?,
        followers: json['followers'] as int?,
        following: json['following'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        privateGists: json['private_gists'] as int?,
        totalPrivateRepos: json['total_private_repos'] as int?,
        ownedPrivateRepos: json['owned_private_repos'] as int?,
        diskUsage: json['disk_usage'] as int?,
        collaborators: json['collaborators'] as int?,
        twoFactorAuthentication: json['two_factor_authentication'] as bool?,
        plan: json['plan'] == null
            ? null
            : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin,
        'name': name,
        'company': company,
        'blog': blog,
        'location': location,
        'email': email,
        'hireable': hireable,
        'bio': bio,
        'twitter_username': twitterUsername,
        'public_repos': publicRepos,
        'public_gists': publicGists,
        'followers': followers,
        'following': following,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'private_gists': privateGists,
        'total_private_repos': totalPrivateRepos,
        'owned_private_repos': ownedPrivateRepos,
        'disk_usage': diskUsage,
        'collaborators': collaborators,
        'two_factor_authentication': twoFactorAuthentication,
        'plan': plan?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin,
      name,
      company,
      blog,
      location,
      email,
      hireable,
      bio,
      twitterUsername,
      publicRepos,
      publicGists,
      followers,
      following,
      createdAt,
      updatedAt,
      privateGists,
      totalPrivateRepos,
      ownedPrivateRepos,
      diskUsage,
      collaborators,
      twoFactorAuthentication,
      plan,
    ];
  }
}
