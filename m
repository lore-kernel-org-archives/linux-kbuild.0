Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47728 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751004AbaHPGlj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Aug 2014 02:41:39 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 0/3] scripts/tags.sh: some emacs fixes
Date: Sat, 16 Aug 2014 07:56:55 +0200
Message-Id: <1408168618-6269-1-git-send-email-dirk@gouders.net>
In-Reply-To: <gh61htovas.fsf@quad.gouders.net>
References: <gh61htovas.fsf@quad.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Dirk Gouders <dirk@gouders.net>, Masatake YAMATO <yamato@redhat.com>, linux-kbuild@vger.kernel.org

A question of Masatake Yamato made me notice some warnings when using
the emacs versions of ctags/etags.

I fixed them in three steps to highlight what the emacs versions of
the programs do not like; patch #2 basically extends another commit
that removed macros that regular expressions meant to match.

Dirk Gouders (3):
  scripts/tags.sh: Don't specify kind-spec for emacs' ctags/etags
  scripts/tags.sh: remove *PCGFLAGS regular expressions
  scripts/tags.sh: fix DEFINE_HASHTABLE in emacs case

 scripts/tags.sh | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

-- 
2.0.2

