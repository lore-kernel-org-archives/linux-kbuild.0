Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41298 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932293AbcHBTXp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 15:23:45 -0400
Date: Tue, 2 Aug 2016 21:04:52 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild misc changes for v4.8-rc1
Message-ID: <20160802190452.GA10885@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: deepa.kernel@gmail.com, henning.schild@siemens.com, linux-kernel@lebenslange-mailadresse.de, marmistrz.dev@gmail.com, mcgrof@kernel.org, vaishali.thakkar@oracle.com, ydroneaud@opteya.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

these is the non-critical part of kbuild for v4.8-rc1:
- coccicheck script improvements by Luis R. Rodriguez and Deepa Dinamani
- new coccinelle patches by Yann Droneaud and Vaishali Thakkar
- debian packaging fixes by Wilfried Klaebe, Henning Schild and Marcin
  Mielniczuk.

Thanks,
Michal


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 4c586062b275dcddc18f521ac092cf0f600a36de:

  Fix the Debian packaging script on systems with no codename (2016-07-26 23:12:08 +0200)

----------------------------------------------------------------
Deepa Dinamani (1):
      coccicheck: Allow for overriding spatch flags

Henning Schild (1):
      builddeb: fix file permissions before packaging

Luis R. Rodriguez (9):
      coccicheck: move spatch binary check up
      coccicheck: make SPFLAGS more useful
      coccicheck: enable parmap support
      coccicheck: add support for DEBUG_FILE
      coccicheck: replace --very-quiet with --quiet when debugging
      scripts: add Linux .cocciconfig for coccinelle
      coccicheck: add support for requring a coccinelle version
      coccicheck: refer to Documentation/coccinelle.txt and wiki
      scripts/coccinelle: require coccinelle >= 1.0.4 on device_node_continue.cocci

Marcin Mielniczuk (1):
      Fix the Debian packaging script on systems with no codename

Vaishali Thakkar (1):
      Coccinelle: noderef: Add new rules and correct the old rule

Wilfried Klaebe (1):
      builddeb: really include objtool binary in headers package

Yann Droneaud (3):
      coccinelle: also catch kzfree() issues
      coccinelle: recognize more devm_* memory allocation functions
      coccinelle: catch krealloc() on devm_*() allocated memory

 .cocciconfig                                       |   3 +
 .gitignore                                         |   1 +
 Documentation/coccinelle.txt                       | 148 ++++++++++++++++++++-
 scripts/coccicheck                                 |  96 +++++++++++--
 scripts/coccinelle/free/devm_free.cocci            |  26 ++++
 scripts/coccinelle/free/ifnullfree.cocci           |   4 +-
 scripts/coccinelle/free/kfree.cocci                |  18 ++-
 scripts/coccinelle/free/kfreeaddr.cocci            |   6 +-
 .../iterators/device_node_continue.cocci           |   3 +
 scripts/coccinelle/misc/noderef.cocci              |  18 ++-
 scripts/package/builddeb                           |  11 +-
 11 files changed, 313 insertions(+), 21 deletions(-)
 create mode 100644 .cocciconfig
