import 'plan.dart';

class User {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
  String name;
  String company;
  String blog;
  String location;
  String email;
  String bio;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  String createdAt;
  String updatedAt;
  int privateGists;
  int totalPrivateRepos;
  int ownedPrivateRepos;
  int diskUsage;
  int collaborators;
  bool twoFactorAuthentication;
  dynamic hireable;
  dynamic twitterUsername;
  Plan? plan;

  User({
    this.login = '',
    this.id = 0,
    this.nodeId = '',
    this.avatarUrl = '',
    this.gravatarId = '',
    this.url = '',
    this.htmlUrl = '',
    this.followersUrl = '',
    this.followingUrl = '',
    this.gistsUrl = '',
    this.starredUrl = '',
    this.subscriptionsUrl = '',
    this.organizationsUrl = '',
    this.reposUrl = '',
    this.eventsUrl = '',
    this.receivedEventsUrl = '',
    this.type = 'User',
    this.siteAdmin = false,
    this.name = '',
    this.company = '',
    this.blog = '',
    this.location = '',
    this.email = '',
    this.bio = '',
    this.publicRepos = 0,
    this.publicGists = 0,
    this.followers = 0,
    this.following = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.privateGists = 0,
    this.totalPrivateRepos = 0,
    this.ownedPrivateRepos = 0,
    this.diskUsage = 0,
    this.collaborators = 0,
    this.twoFactorAuthentication = false,
    this.hireable,
    this.twitterUsername,
    this.plan,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json['login'] as String? ?? '',
        id: json['id'] as int? ?? 0,
        nodeId: json['node_id'] as String? ?? '',
        avatarUrl: json['avatar_url'] as String? ?? '',
        gravatarId: json['gravatar_id'] as String? ?? '',
        url: json['url'] as String? ?? '',
        htmlUrl: json['html_url'] as String? ?? '',
        followersUrl: json['followers_url'] as String? ?? '',
        followingUrl: json['following_url'] as String? ?? '',
        gistsUrl: json['gists_url'] as String? ?? '',
        starredUrl: json['starred_url'] as String? ?? '',
        subscriptionsUrl: json['subscriptions_url'] as String? ?? '',
        organizationsUrl: json['organizations_url'] as String? ?? '',
        reposUrl: json['repos_url'] as String? ?? '',
        eventsUrl: json['events_url'] as String? ?? '',
        receivedEventsUrl: json['received_events_url'] as String? ?? '',
        type: json['type'] as String? ?? 'User',
        siteAdmin: json['site_admin'] as bool? ?? false,
        name: json['name'] as String? ?? '',
        company: json['company'] as String? ?? '',
        blog: json['blog'] as String? ?? '',
        location: json['location'] as String? ?? '',
        email: json['email'] as String? ?? '',
        bio: json['bio'] as String? ?? '',
        publicRepos: json['public_repos'] as int? ?? 0,
        publicGists: json['public_gists'] as int? ?? 0,
        followers: json['followers'] as int? ?? 0,
        following: json['following'] as int? ?? 0,
        createdAt: json['created_at'] as String? ?? '',
        updatedAt: json['updated_at'] as String? ?? '',
        privateGists: json['private_gists'] as int? ?? 0,
        totalPrivateRepos: json['total_private_repos'] as int? ?? 0,
        ownedPrivateRepos: json['owned_private_repos'] as int? ?? 0,
        diskUsage: json['disk_usage'] as int? ?? 0,
        collaborators: json['collaborators'] as int? ?? 0,
        twoFactorAuthentication:
            json['two_factor_authentication'] as bool? ?? false,
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
        'bio': bio,
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
        'hireable': hireable,
        'twitter_username': twitterUsername,
        'plan': plan?.toJson(),
      };
}
