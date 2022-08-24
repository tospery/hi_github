import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'plan.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String login;
  final int id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'gravatar_id')
  final String gravatarId;
  final String url;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'followers_url')
  final String followersUrl;
  @JsonKey(name: 'following_url')
  final String followingUrl;
  @JsonKey(name: 'gists_url')
  final String gistsUrl;
  @JsonKey(name: 'starred_url')
  final String starredUrl;
  @JsonKey(name: 'subscriptions_url')
  final String subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  final String organizationsUrl;
  @JsonKey(name: 'repos_url')
  final String reposUrl;
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @JsonKey(name: 'received_events_url')
  final String receivedEventsUrl;
  final String type;
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final String bio;
  @JsonKey(name: 'public_repos')
  final int publicRepos;
  @JsonKey(name: 'public_gists')
  final int publicGists;
  final int followers;
  final int following;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'private_gists')
  final int privateGists;
  @JsonKey(name: 'total_private_repos')
  final int totalPrivateRepos;
  @JsonKey(name: 'owned_private_repos')
  final int ownedPrivateRepos;
  @JsonKey(name: 'disk_usage')
  final int diskUsage;
  final int collaborators;
  @JsonKey(name: 'two_factor_authentication')
  final bool twoFactorAuthentication;
  final dynamic hireable;
  @JsonKey(name: 'twitter_username')
  final dynamic twitterUsername;
  final Plan? plan;

  const User({
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  bool get isValid => id != 0;
  int get repositoryCount => publicRepos + totalPrivateRepos;
  String get dynamicCardUrlString => 'https://ghchart.rshah.org/1CA035/$login';

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
      bio,
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
      hireable,
      twitterUsername,
      plan,
    ];
  }
}
