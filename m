Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59179 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751590AbbJAJ6g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 05:58:36 -0400
Subject: Re: [PATCH] drm: Hack around CONFIG_AGP=m build failures
References: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
 <8737xvc87a.fsf@intel.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <560D03C8.70309@suse.com>
Date: Thu, 1 Oct 2015 11:58:32 +0200
MIME-Version: 1.0
In-Reply-To: <8737xvc87a.fsf@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>

On 2015-10-01 10:19, Jani Nikula wrote:
> On Thu, 01 Oct 2015, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> Surprisingly kbuild can't cope with tristates in the
>> <module>-$(CONFIG_FOO) pattern. This patch hacks up a solution.
> 
> Given that it's two distinct Makefile variables (foo-y and foo-m) being
> assigned to, I don't really find this surprising. Maybe this could be
> made to work as a convenience, but there might be other, more surpising
> consequences.

I actually think that kbuild should be able to handle this. The likely
reason why it is not doing it right now is that in an ideal world,
modules are modules can be built out of tree against just the kernel and
their static dependencies. In real world, we sometimes have features in
modules that are enabled if other modules are enabled. I'll post a patch
later. We also have lots of tests fo CONFIG_FOO || CONFIG_FOO_MODULE in
built-in code, which is a similar case.

Michal
