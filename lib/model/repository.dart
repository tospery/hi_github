import 'package:hi_flutter/hi_flutter.dart';

import 'license.dart';
import 'user.dart';

class Repository extends HiModel {
  final String? nodeId;
  final String? name;
  final String? fullName;
  final String? htmlUrl;
  final String? description;
  final String? url;
  final String? forksUrl;
  final String? keysUrl;
  final String? collaboratorsUrl;
  final String? teamsUrl;
  final String? hooksUrl;
  final String? issueEventsUrl;
  final String? eventsUrl;
  final String? assigneesUrl;
  final String? branchesUrl;
  final String? tagsUrl;
  final String? blobsUrl;
  final String? gitTagsUrl;
  final String? gitRefsUrl;
  final String? treesUrl;
  final String? statusesUrl;
  final String? languagesUrl;
  final String? stargazersUrl;
  final String? contributorsUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? commitsUrl;
  final String? gitCommitsUrl;
  final String? commentsUrl;
  final String? issueCommentUrl;
  final String? contentsUrl;
  final String? compareUrl;
  final String? mergesUrl;
  final String? archiveUrl;
  final String? downloadsUrl;
  final String? issuesUrl;
  final String? pullsUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? labelsUrl;
  final String? releasesUrl;
  final String? deploymentsUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final String? homepage;
  final String? language;
  final String? visibility;
  final String? defaultBranch;
  final String? mirrorUrl;
  final bool? private;
  final bool? fork;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final bool? archived;
  final bool? disabled;
  final bool? allowForking;
  final bool? isTemplate;
  final bool? webCommitSignoffRequired;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final int? forksCount;
  final int? openIssuesCount;
  final int? forks;
  final int? openIssues;
  final int? watchers;
  final User? owner;
  final License? license;
  final List<String>? topics;

  const Repository({
    super.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        id: json.stringForKey('id'),
        nodeId: json.stringForKey('node_id'),
        name: json.stringForKey('name'),
        fullName: json.stringForKey('full_name'),
        htmlUrl: json.stringForKey('html_url'),
        description: json.stringForKey('description'),
        url: json.stringForKey('url'),
        forksUrl: json.stringForKey('forks_url'),
        keysUrl: json.stringForKey('keys_url'),
        collaboratorsUrl: json.stringForKey('collaborators_url'),
        teamsUrl: json.stringForKey('teams_url'),
        hooksUrl: json.stringForKey('hooks_url'),
        issueEventsUrl: json.stringForKey('issue_events_url'),
        eventsUrl: json.stringForKey('events_url'),
        assigneesUrl: json.stringForKey('assignees_url'),
        branchesUrl: json.stringForKey('branches_url'),
        tagsUrl: json.stringForKey('tags_url'),
        blobsUrl: json.stringForKey('blobs_url'),
        gitTagsUrl: json.stringForKey('git_tags_url'),
        gitRefsUrl: json.stringForKey('git_refs_url'),
        treesUrl: json.stringForKey('trees_url'),
        statusesUrl: json.stringForKey('statuses_url'),
        languagesUrl: json.stringForKey('languages_url'),
        stargazersUrl: json.stringForKey('stargazers_url'),
        contributorsUrl: json.stringForKey('contributors_url'),
        subscribersUrl: json.stringForKey('subscribers_url'),
        subscriptionUrl: json.stringForKey('subscription_url'),
        commitsUrl: json.stringForKey('commits_url'),
        gitCommitsUrl: json.stringForKey('git_commits_url'),
        commentsUrl: json.stringForKey('comments_url'),
        issueCommentUrl: json.stringForKey('issue_comment_url'),
        contentsUrl: json.stringForKey('contents_url'),
        compareUrl: json.stringForKey('compare_url'),
        mergesUrl: json.stringForKey('merges_url'),
        archiveUrl: json.stringForKey('archive_url'),
        downloadsUrl: json.stringForKey('downloads_url'),
        issuesUrl: json.stringForKey('issues_url'),
        pullsUrl: json.stringForKey('pulls_url'),
        milestonesUrl: json.stringForKey('milestones_url'),
        notificationsUrl: json.stringForKey('notifications_url'),
        labelsUrl: json.stringForKey('labels_url'),
        releasesUrl: json.stringForKey('releases_url'),
        deploymentsUrl: json.stringForKey('deployments_url'),
        createdAt: json.stringForKey('created_at'),
        updatedAt: json.stringForKey('updated_at'),
        pushedAt: json.stringForKey('pushed_at'),
        gitUrl: json.stringForKey('git_url'),
        sshUrl: json.stringForKey('ssh_url'),
        cloneUrl: json.stringForKey('clone_url'),
        svnUrl: json.stringForKey('svn_url'),
        language: json.stringForKey('language'),
        homepage: json.stringForKey('homepage'),
        visibility: json.stringForKey('visibility'),
        defaultBranch: json.stringForKey('default_branch'),
        mirrorUrl: json.stringForKey('mirror_url'),
        private: json.boolForKey('private'),
        hasIssues: json.boolForKey('has_issues'),
        hasProjects: json.boolForKey('has_projects'),
        hasDownloads: json.boolForKey('has_downloads'),
        hasWiki: json.boolForKey('has_wiki'),
        hasPages: json.boolForKey('has_pages'),
        archived: json.boolForKey('archived'),
        disabled: json.boolForKey('disabled'),
        allowForking: json.boolForKey('allow_forking'),
        isTemplate: json.boolForKey('is_template'),
        fork: json.boolForKey('fork'),
        webCommitSignoffRequired:
            json.boolForKey('web_commit_signoff_required'),
        size: json.intForKey('size'),
        stargazersCount: json.intForKey('stargazers_count'),
        watchersCount: json.intForKey('watchers_count'),
        forksCount: json.intForKey('forks_count'),
        openIssuesCount: json.intForKey('open_issues_count'),
        forks: json.intForKey('forks'),
        openIssues: json.intForKey('open_issues'),
        watchers: json.intForKey('watchers'),
        owner: json['owner'] == null
            ? null
            : User.fromJson(json['owner'] as Map<String, dynamic>),
        license: json['license'] == null
            ? null
            : License.fromJson(json['license'] as Map<String, dynamic>),
        topics: (json['topics'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'node_id': nodeId,
        'name': name,
        'full_name': fullName,
        'private': private,
        'owner': owner?.toJson(),
        'html_url': htmlUrl,
        'description': description,
        'fork': fork,
        'url': url,
        'forks_url': forksUrl,
        'keys_url': keysUrl,
        'collaborators_url': collaboratorsUrl,
        'teams_url': teamsUrl,
        'hooks_url': hooksUrl,
        'issue_events_url': issueEventsUrl,
        'events_url': eventsUrl,
        'assignees_url': assigneesUrl,
        'branches_url': branchesUrl,
        'tags_url': tagsUrl,
        'blobs_url': blobsUrl,
        'git_tags_url': gitTagsUrl,
        'git_refs_url': gitRefsUrl,
        'trees_url': treesUrl,
        'statuses_url': statusesUrl,
        'languages_url': languagesUrl,
        'stargazers_url': stargazersUrl,
        'contributors_url': contributorsUrl,
        'subscribers_url': subscribersUrl,
        'subscription_url': subscriptionUrl,
        'commits_url': commitsUrl,
        'git_commits_url': gitCommitsUrl,
        'comments_url': commentsUrl,
        'issue_comment_url': issueCommentUrl,
        'contents_url': contentsUrl,
        'compare_url': compareUrl,
        'merges_url': mergesUrl,
        'archive_url': archiveUrl,
        'downloads_url': downloadsUrl,
        'issues_url': issuesUrl,
        'pulls_url': pullsUrl,
        'milestones_url': milestonesUrl,
        'notifications_url': notificationsUrl,
        'labels_url': labelsUrl,
        'releases_url': releasesUrl,
        'deployments_url': deploymentsUrl,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'pushed_at': pushedAt,
        'git_url': gitUrl,
        'ssh_url': sshUrl,
        'clone_url': cloneUrl,
        'svn_url': svnUrl,
        'homepage': homepage,
        'size': size,
        'stargazers_count': stargazersCount,
        'watchers_count': watchersCount,
        'language': language,
        'has_issues': hasIssues,
        'has_projects': hasProjects,
        'has_downloads': hasDownloads,
        'has_wiki': hasWiki,
        'has_pages': hasPages,
        'forks_count': forksCount,
        'mirror_url': mirrorUrl,
        'archived': archived,
        'disabled': disabled,
        'open_issues_count': openIssuesCount,
        'license': license?.toJson(),
        'allow_forking': allowForking,
        'is_template': isTemplate,
        'web_commit_signoff_required': webCommitSignoffRequired,
        'topics': topics,
        'visibility': visibility,
        'forks': forks,
        'open_issues': openIssues,
        'watchers': watchers,
        'default_branch': defaultBranch,
      };

  Repository copyWith({
    String? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    User? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    String? createdAt,
    String? updatedAt,
    String? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    int? forksCount,
    String? mirrorUrl,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    License? license,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    List<String>? topics,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
  }) {
    return Repository(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      private: private ?? this.private,
      owner: owner ?? this.owner,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      description: description ?? this.description,
      fork: fork ?? this.fork,
      url: url ?? this.url,
      forksUrl: forksUrl ?? this.forksUrl,
      keysUrl: keysUrl ?? this.keysUrl,
      collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
      teamsUrl: teamsUrl ?? this.teamsUrl,
      hooksUrl: hooksUrl ?? this.hooksUrl,
      issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      assigneesUrl: assigneesUrl ?? this.assigneesUrl,
      branchesUrl: branchesUrl ?? this.branchesUrl,
      tagsUrl: tagsUrl ?? this.tagsUrl,
      blobsUrl: blobsUrl ?? this.blobsUrl,
      gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
      gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
      treesUrl: treesUrl ?? this.treesUrl,
      statusesUrl: statusesUrl ?? this.statusesUrl,
      languagesUrl: languagesUrl ?? this.languagesUrl,
      stargazersUrl: stargazersUrl ?? this.stargazersUrl,
      contributorsUrl: contributorsUrl ?? this.contributorsUrl,
      subscribersUrl: subscribersUrl ?? this.subscribersUrl,
      subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
      commitsUrl: commitsUrl ?? this.commitsUrl,
      gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
      contentsUrl: contentsUrl ?? this.contentsUrl,
      compareUrl: compareUrl ?? this.compareUrl,
      mergesUrl: mergesUrl ?? this.mergesUrl,
      archiveUrl: archiveUrl ?? this.archiveUrl,
      downloadsUrl: downloadsUrl ?? this.downloadsUrl,
      issuesUrl: issuesUrl ?? this.issuesUrl,
      pullsUrl: pullsUrl ?? this.pullsUrl,
      milestonesUrl: milestonesUrl ?? this.milestonesUrl,
      notificationsUrl: notificationsUrl ?? this.notificationsUrl,
      labelsUrl: labelsUrl ?? this.labelsUrl,
      releasesUrl: releasesUrl ?? this.releasesUrl,
      deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
      gitUrl: gitUrl ?? this.gitUrl,
      sshUrl: sshUrl ?? this.sshUrl,
      cloneUrl: cloneUrl ?? this.cloneUrl,
      svnUrl: svnUrl ?? this.svnUrl,
      homepage: homepage ?? this.homepage,
      size: size ?? this.size,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      language: language ?? this.language,
      hasIssues: hasIssues ?? this.hasIssues,
      hasProjects: hasProjects ?? this.hasProjects,
      hasDownloads: hasDownloads ?? this.hasDownloads,
      hasWiki: hasWiki ?? this.hasWiki,
      hasPages: hasPages ?? this.hasPages,
      forksCount: forksCount ?? this.forksCount,
      mirrorUrl: mirrorUrl ?? this.mirrorUrl,
      archived: archived ?? this.archived,
      disabled: disabled ?? this.disabled,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      license: license ?? this.license,
      allowForking: allowForking ?? this.allowForking,
      isTemplate: isTemplate ?? this.isTemplate,
      webCommitSignoffRequired:
          webCommitSignoffRequired ?? this.webCommitSignoffRequired,
      topics: topics ?? this.topics,
      visibility: visibility ?? this.visibility,
      forks: forks ?? this.forks,
      openIssues: openIssues ?? this.openIssues,
      watchers: watchers ?? this.watchers,
      defaultBranch: defaultBranch ?? this.defaultBranch,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      nodeId,
      name,
      fullName,
      private,
      owner,
      htmlUrl,
      description,
      fork,
      url,
      forksUrl,
      keysUrl,
      collaboratorsUrl,
      teamsUrl,
      hooksUrl,
      issueEventsUrl,
      eventsUrl,
      assigneesUrl,
      branchesUrl,
      tagsUrl,
      blobsUrl,
      gitTagsUrl,
      gitRefsUrl,
      treesUrl,
      statusesUrl,
      languagesUrl,
      stargazersUrl,
      contributorsUrl,
      subscribersUrl,
      subscriptionUrl,
      commitsUrl,
      gitCommitsUrl,
      commentsUrl,
      issueCommentUrl,
      contentsUrl,
      compareUrl,
      mergesUrl,
      archiveUrl,
      downloadsUrl,
      issuesUrl,
      pullsUrl,
      milestonesUrl,
      notificationsUrl,
      labelsUrl,
      releasesUrl,
      deploymentsUrl,
      createdAt,
      updatedAt,
      pushedAt,
      gitUrl,
      sshUrl,
      cloneUrl,
      svnUrl,
      homepage,
      size,
      stargazersCount,
      watchersCount,
      language,
      hasIssues,
      hasProjects,
      hasDownloads,
      hasWiki,
      hasPages,
      forksCount,
      mirrorUrl,
      archived,
      disabled,
      openIssuesCount,
      license,
      allowForking,
      isTemplate,
      webCommitSignoffRequired,
      topics,
      visibility,
      forks,
      openIssues,
      watchers,
      defaultBranch,
    ];
  }
}
