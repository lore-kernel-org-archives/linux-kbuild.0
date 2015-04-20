Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40050 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752380AbbDTO5R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 10:57:17 -0400
Date: Mon, 20 Apr 2015 16:57:14 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild misc update for v4.1-rc1
Message-ID: <20150420145714.GA5703@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: alp+linux@alexpilon.ca, fabf@skynet.be, valentinrothberg@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

this is the remaining part of kbuild stuff for v4.1-rc1:
- One wew coccinelle script and a clarification of the proposed fix
  in bugon.coccinelle
- CONFIG_KERNEL_LZ4 support for extract-ikconfig

Michal

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 33236415ece63d5689411f3ddb676eeb93af2698:

  scripts/coccinelle/misc/bugon.cocci: update bug_on conversion warning (2015-04-15 14:21:31 +0200)

----------------------------------------------------------------
Alex Pilon (1):
      scripts/extract-ikconfig: Support LZ4-compressed images.

Fabian Frederick (1):
      scripts/coccinelle/misc/bugon.cocci: update bug_on conversion warning

Valentin Rothberg (1):
      irqf_oneshot.cocci: add check of devm_request_threaded_irq()

 scripts/coccinelle/misc/bugon.cocci        |  2 +-
 scripts/coccinelle/misc/irqf_oneshot.cocci | 24 ++++++++++++++++++++++++
 scripts/extract-ikconfig                   |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)
