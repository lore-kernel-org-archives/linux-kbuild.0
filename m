Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:38673 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751995Ab0FLSHh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Jun 2010 14:07:37 -0400
Date: Sat, 12 Jun 2010 20:07:35 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT] kbuild modpost fix
Message-ID: <20100612180735.GA31404@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: khc@pm.waw.pl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Please pull another kbuild fix. This time it's a pointer arithmetics
overflow in modpost that started to show up with newer gcc.

Thanks,
Michal

The following changes since commit 607b30fcf20c6e5339591692db6ffa0b15e041a0:

  kbuild: Create output directory in Makefile.modbuiltin (2010-06-10 12:23:08 +0200)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git rc-fixes

Krzysztof Halasa (1):
      kbuild: Fix modpost segfault

 scripts/mod/modpost.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
