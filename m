Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:54314 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932296Ab2EVUVK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 May 2012 16:21:10 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: kconfig-frontends-3.4.0-0 released
Date: Tue, 22 May 2012 22:21:05 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201205222221.05548.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

I'm pleased to announce the release of kconfig-frontends 3.4.0-0!
Go download it there:
    http://ymorin.is-a-geek.org/download/kconfig-frontends/kconfig-frontends-3.4.0-0.tar.xz
    http://ymorin.is-a-geek.org/download/kconfig-frontends/kconfig-frontends-3.4.0-0.tar.bz2

The kconfig-frontends package provides the kconfig parser, as well as all the
kconfig frontends and utilities, packaged using the traditional autotools, so
the kconfig infrastructure is easy to deploy, either locally or system-wide.

What's new since 3.3.0-0:
  - all programs are intalled with the 'kconfig-' prefix by default
  - the kconfig documentation has been added
  - the parser's headers are isntalled into their own sub-dir
  - some side utilities have been added from the Linux kernel tree:
    - kconfig-diff      show differences between two .config files
    - kconfig-gettext   prepare catalog of options strings for L10n
    - kconfig-merge     merge .config fragments
    - kconfig-tweak     get and set .config optiond from the command line

Thank you to Arnout Vandecappelle and Peter Kjellerstedt for their patches in
this release cycle. :-)

As a reminder, the home for kconfig-frontends is:
  http://ymorin.is-a-geek.org/projects/kconfig-frontends

And the repository can be browsed or hg-cloned from:
  http://ymorin.is-a-geek.org/hg/kconfig-frontends

kconfig-frontends is not meant to replace the in-tree Linux kconfig, but
really targets third-party projects that want an easy path to following the
evolution of kconfig, without the burden to manually synchronise from the
Linux kernel source tree.

Any comment, any feedback, any patch is welcome! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
