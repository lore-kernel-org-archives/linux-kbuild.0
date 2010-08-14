Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:63689 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756155Ab0HNX0X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Aug 2010 19:26:23 -0400
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
Date: Sun, 15 Aug 2010 01:26:22 +0200
Message-ID: <AANLkTimYDzCowvmKgSDp0BJjLHadvtDgCVJkZgdAt4u7@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix savedefconfig with choice marked optional
From: Sedat Dilek <sedat.dilek@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Recent kbuild/kconfig patches seem not to be in
<http://repo.or.cz/w/linux-kbuild.git>?

Looks like there is a new home:

-T:      git git://repo.or.cz/linux-kbuild.git for-next
-T:      git git://repo.or.cz/linux-kbuild.git for-linus
+T:      git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git
for-next
+T:      git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git
for-linus

Also, I would appreciate to have the Vcs-Browser URL (to say it in
"Debian language") in the MAINTAINERS file.
Personally, I check the GIT repos/branches via web-browser.

T:      http://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git
T:      https://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git

What do you think of that?

- Sedat -

$ grep kbuild MAINTAINERS
L:      linux-kbuild@vger.kernel.org
Q:      http://patchwork.kernel.org/project/linux-kbuild/list/
F:      Documentation/kbuild/kconfig-language.txt
T:      git git://repo.or.cz/linux-kbuild.git for-next
T:      git git://repo.or.cz/linux-kbuild.git for-linus
L:      linux-kbuild@vger.kernel.org
F:      Documentation/kbuild/
