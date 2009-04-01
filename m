Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml107.kpnxchange.com ([195.121.3.11]:58156 "EHLO
	CPSMTPM-EML107.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758880AbZDATdl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 15:33:41 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 0/5] Improve flexibility of deb-pkg target
Date: Wed, 1 Apr 2009 21:33:36 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904012133.37387.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Sam,

This series of patches aims to make the deb-pkg target more flexible.
I've been using these patches for the past year or so and they've greatly
improved my workflow for kernel testing on 4 different architectures
(2 cross-compiled).

The last 2 patches I've submitted before (in Feb. 2008) but were not
applied as you had some questions. This new series has improved versions
and I'll address your questions below.

[1/5] deb-pkg: minor general improvements in builddeb script
[2/5] deb-pkg: fix 'file not found' error when building .deb package for arm

These first 2 patches are minor improvements and fixes.

[3/5] deb-pkg: pass Debian maintainer script parameters to packaging hook scripts

This allows to make hook scripts more specific differentiate their
behavior for e.g. package installation, removal or upgrade. It's very
much Debian specific.

[4/5] deb-pkg: allow to specify a custom revision for .deb packages

This has helped me to use a different versioning system for bisections
than for "regular" builds. Note that this does not affect the kernel
version (which is part of the package name), but only the version of
the generated .deb package itself.

[5/5] deb-pkg: allow alternative hook scripts directory in .deb packages

This last patch comes in two variants (5a and 5b) because for my previous
submission you asked:
> Does this btw have to be an environment variable?
> Why not make it a config option?

I personally prefer the first variant (env var) because I feel having a
config option for this will mainly be confusing for people not using the
deb-pkg target (probably the vast majority :-).
Either variant works for me, so I'm happy to let you choose.

For my previous version of patches 4 and 5 you also asked if the changes
could be relevant for .rpm packages. AFAICT they are not:
- .rpm packages do not have a package version separate from the kernel
  version;
- .rpm packages do not have a hook scripts structure; it's a .deb-specific
  mechanism also used for kernel images built using other methods (official
  kernels, make-kpkg)
But I'm not an .rpm user, so I may be wrong.


After the changes have been accepted I plan to write a doc explaining how
the deb-pkg target works. I'll submit that separately later.

A few of the patches have minor conflicts with the patch series Maximilian
Attems submitted yesterday, but they should be easy to resolve. If you
prefer I'll be happy to rebase mine on top of his series when it's
clear what will get accepted.

Cheers,
FJP

Diffstat with the 5a patch:
 scripts/package/builddeb |   51 +++++++++++++++++++++++++++++----------------
 1 files changed, 33 insertions(+), 18 deletions(-)

With the 5b variant this becomes:
 init/Kconfig             |   12 +++++++++++
 scripts/package/Makefile |    2 +
 scripts/package/builddeb |   50 +++++++++++++++++++++++++++++----------------
 3 files changed, 46 insertions(+), 18 deletions(-)
