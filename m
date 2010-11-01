Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:34843 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754379Ab0KAVBu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Nov 2010 17:01:50 -0400
From: Andy Whitcroft <apw@canonical.com>
Subject: [PATCH 0/1] Fix kconfig core dumps running make oldconfig
Date: Mon,  1 Nov 2010 21:01:43 +0000
Message-Id: <1288645304-2794-1-git-send-email-apw@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When running make oldconfig cirtain configurations kconfig will coredump.
This is triggered by an issue calculating the length of the result of
expanding symbol values containing variables.  This prevents builds on
these configs.

This bug was exposed by the commit below which _correctly_ fixed the
usage of realloc():

  commit 19c29f326075e2c66e34d98f2a0cf22901b2d8e9
  Author: Michal Marek <mmarek@suse.cz>
  Date:   Thu Sep 30 22:21:12 2010 +0200

    kconfig: Fix realloc usage()

-apw

Andy Whitcroft (1):
  kconfig: sym_expand_string_value: allow for string termination when
    reallocing

 scripts/kconfig/symbol.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

