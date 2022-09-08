import 'package:hi_get/hi_get.dart';
import 'plan.dart';

class User extends Equatable {
  final String? login;
  final String? id;
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json.stringForKey('id'),
        login: json.stringForKey('login'),
        nodeId: json.stringForKey('node_id'),
        avatarUrl: json.stringForKey('avatar_url'),
        gravatarId: json.stringForKey('gravatar_id'),
        url: json.stringForKey('url'),
        htmlUrl: json.stringForKey('html_url'),
        followersUrl: json.stringForKey('followers_url'),
        followingUrl: json.stringForKey('following_url'),
        gistsUrl: json.stringForKey('gists_url'),
        starredUrl: json.stringForKey('starred_url'),
        subscriptionsUrl: json.stringForKey('subscriptions_url'),
        organizationsUrl: json.stringForKey('organizations_url'),
        reposUrl: json.stringForKey('repos_url'),
        eventsUrl: json.stringForKey('events_url'),
        receivedEventsUrl: json.stringForKey('received_events_url'),
        type: json.stringForKey('type'),
        name: json.stringForKey('name'),
        company: json.stringForKey('company'),
        blog: json.stringForKey('blog'),
        location: json.stringForKey('location'),
        email: json.stringForKey('email'),
        bio: json.stringForKey('bio'),
        createdAt: json.stringForKey('created_at'),
        updatedAt: json.stringForKey('updated_at'),
        siteAdmin: json.boolForKey('site_admin'),
        twoFactorAuthentication: json.boolForKey('two_factor_authentication'),
        publicRepos: json.intForKey('public_repos'),
        publicGists: json.intForKey('public_gists'),
        followers: json.intForKey('followers'),
        following: json.intForKey('following'),
        privateGists: json.intForKey('private_gists'),
        totalPrivateRepos: json.intForKey('total_private_repos'),
        ownedPrivateRepos: json.intForKey('owned_private_repos'),
        diskUsage: json.intForKey('disk_usage'),
        collaborators: json.intForKey('collaborators'),
        hireable: json['hireable'] as dynamic,
        twitterUsername: json['twitter_username'] as dynamic,
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

  User copyWith({
    String? login,
    String? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    dynamic hireable,
    String? bio,
    dynamic twitterUsername,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
    String? createdAt,
    String? updatedAt,
    int? privateGists,
    int? totalPrivateRepos,
    int? ownedPrivateRepos,
    int? diskUsage,
    int? collaborators,
    bool? twoFactorAuthentication,
    Plan? plan,
  }) {
    return User(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      name: name ?? this.name,
      company: company ?? this.company,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      hireable: hireable ?? this.hireable,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      privateGists: privateGists ?? this.privateGists,
      totalPrivateRepos: totalPrivateRepos ?? this.totalPrivateRepos,
      ownedPrivateRepos: ownedPrivateRepos ?? this.ownedPrivateRepos,
      diskUsage: diskUsage ?? this.diskUsage,
      collaborators: collaborators ?? this.collaborators,
      twoFactorAuthentication:
          twoFactorAuthentication ?? this.twoFactorAuthentication,
      plan: plan ?? this.plan,
    );
  }

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
