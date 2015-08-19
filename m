Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60591 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753093AbbHSMuq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 08:50:46 -0400
Subject: Re: [PATCH] scripts: Extract kernel headers for out of tree modules
 build
References: <1439967036-18297-1-git-send-email-daniel.baluta@intel.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D47BA4.4040601@suse.com>
Date: Wed, 19 Aug 2015 14:50:44 +0200
MIME-Version: 1.0
In-Reply-To: <1439967036-18297-1-git-send-email-daniel.baluta@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Baluta <daniel.baluta@intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, octavian.purdila@intel.com, bogdan.m.davidoaia@intel.com

On 2015-08-19 08:50, Daniel Baluta wrote:
> scripts/package/builddeb already creates a linux-keader .deb
> package, but we need this feature also for non-Debian distros
> (e.g. Android or LFS).

Kbuild supports building out-of-tree modules by providing the
/lib/modules/*/build and /lib/modules/*/source symlinks, pointing to the
whole build/source trees. IMO, an optimization like your script should
remain part of the distro packaging, which also takes care of the symlinks.

Michal
