Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:1283 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfGaNrF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 09:47:05 -0400
From: Jani Nikula <jani.nikula@intel.com>
Subject: better kbuild support for drivers spanning multiple directories?
Date: Wed, 31 Jul 2019 16:51:24 +0300
Message-ID: <87pnlqmhwj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org


Hi -

The drm/i915 [1][2] driver has grown quite big over the years: 400+
files with a total sloccount of 175k lines. A flat directory structure
just wasn't manageable anymore, and we opted to add subdirectories,
despite the general recommendation [3] not to do this.

Mostly, it works all right, with some quirks. For example, things like

	$ make drivers/gpu/drm/i915/<subdir>/<file>.o

do not work out of the box; we need to add subdir Makefiles to do things
like:

	subdir-ccflags-y += -I$(srctree)/$(src)/..

and include them using obj-y += <subdir>/ in the top level Makefile.

But the main problem really is having to have a top level Makefile
specifying everything, instead of being able to recurse into
subdirectoris with, say, lib-y += <subdir>/, and having that build a lib
within the subdirectory that gets linked into the parent level module.

Is there a better way? Could we have a better way?

BR,
Jani.


[1] drivers/gpu/drm/i915
[2] https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/i915
[3] Documentation/kbuild/modules.rst section 4.3


-- 
Jani Nikula, Intel Open Source Graphics Center
