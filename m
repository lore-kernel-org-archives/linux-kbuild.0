Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from know-smtprelay-omc-7.server.virginmedia.net ([80.0.253.71]:57516
	"EHLO know-smtprelay-omc-7.server.virginmedia.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbbHSTTG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 15:19:06 -0400
Date: Wed, 19 Aug 2015 20:09:35 +0100
From: Ken Moffat <zarniwhoop@ntlworld.com>
Subject: Re: [PATCH] scripts: Extract kernel headers for out of tree modules
 build
Message-ID: <20150819190935.GA8443@milliways>
References: <1439967036-18297-1-git-send-email-daniel.baluta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1439967036-18297-1-git-send-email-daniel.baluta@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Baluta <daniel.baluta@intel.com>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, octavian.purdila@intel.com, bogdan.m.davidoaia@intel.com

On Wed, Aug 19, 2015 at 09:50:36AM +0300, Daniel Baluta wrote:
> scripts/package/builddeb already creates a linux-keader .deb
> package, but we need this feature also for non-Debian distros
> (e.g. Android or LFS).
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@intel.com>

In general, LFS does not need this - but obviously we give you the
freedom to change whatever you do ("your system, your rules").

In particular, we assume that you will build on the machine where
the kernel will run, and also that you may need to rebuild the kernel
several times (for additional .config choices) depending on what
parts of BLFS you build.  And we do not provide a package manager.
So I submit that we are the people least likely to need this.

ĸen
-- 
This one goes up to eleven: but only on a clear day, with the wind in
the right direction.
