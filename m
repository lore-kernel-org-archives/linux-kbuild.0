Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:57505 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbaGMSgo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Jul 2014 14:36:44 -0400
Date: Sun, 13 Jul 2014 20:36:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/6] kbuild: use target compiler for user binaries in
 samples/
Message-ID: <20140713183636.GA17241@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Herrmann <dh.herrmann@googlemail.com>, Jiri Kosina <jkosina@suse.cz>

[PATCH v2 0/6] kbuild: use target compiler for user binaries in samples/

The user-space binaries build in samples/ uses the installed
headers for the kernel.
Therefore it is wrong that they use the host compiler
to build the samples.

This set of patches add kbuild support for building
the userspace programs.
They are build with same endian and bit-size as the kernel,
so in other words no support for buildign 32 bit userspace for
a 64 bit kernel.
The majority of the patch is the Documentation changes,
especially because a new chapter was added.

NOTE: This will likely break the build if the toolchain used do
not include a libc. Let's see how much noise this creates.

I have included a few moe people in this submission as
I assume this has their interest.

Michal - I hope you can take this via the kbuild#misc
tree when any feedback has been addressed.

Changes since first posting (https://lkml.org/lkml/2013/3/31/74):
- Use $(biarch) in X86_32 (feedback from Michael Marek)
- Drop sub-directory support (feedback from Michael Marek)
  o This simplified the uapi support a lot
- Fix clean support (feedback from Michael Marek)
- Added documentation to Documentation/kbuild/
- Use $(CC) as there is no need for a dedicated UAPICC
- Prefer foobar-y over foobar-objs for specifying .o files
  for a binary
- Move cc options to Makefile.uapiprogs and only use -Wall
- Use -isystem to include installed uapi headers before headers
  provided by the installed libc
- Divided up in smaller patches to ease review

	Sam

Sam Ravnborg (6):
      kbuild: add support for building userspace api programs
      samples: refactor Makefile
      samples: use uapiprogs support for seccomp
      samples: use uapiprogs support for hidraw
      samples: fix warnings in uhid-example
      samples: use uapiprogs support for uhid

 Documentation/kbuild/kbuild.txt    |   5 ++
 Documentation/kbuild/makefiles.txt | 132 ++++++++++++++++++++++++-------------
 Makefile                           |   4 ++
 arch/s390/Makefile                 |   2 +
 arch/sparc/Makefile                |   2 +
 arch/x86/Makefile                  |   2 +
 samples/Makefile                   |  16 ++++-
 samples/hidraw/Makefile            |  11 +---
 samples/seccomp/Makefile           |  48 +-------------
 samples/uhid/Makefile              |  11 +---
 samples/uhid/uhid-example.c        |   9 ++-
 scripts/Makefile.build             |   4 ++
 scripts/Makefile.clean             |   9 +--
 scripts/Makefile.uapiprogs         |  63 ++++++++++++++++++
 14 files changed, 196 insertions(+), 122 deletions(-)
