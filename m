Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58697 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752232AbbJAO5D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 10:57:03 -0400
Subject: Re: [PATCH] drm: Hack around CONFIG_AGP=m build failures
References: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
 <8737xvc87a.fsf@intel.com> <560D03C8.70309@suse.com>
 <20151001101757.GV3383@phenom.ffwll.local> <560D4839.3050706@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <560D49BD.6060205@suse.cz>
Date: Thu, 1 Oct 2015 16:57:01 +0200
MIME-Version: 1.0
In-Reply-To: <560D4839.3050706@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>

On 2015-10-01 16:50, Michal Marek wrote:
> On 2015-10-01 12:17, Daniel Vetter wrote:
>> On Thu, Oct 01, 2015 at 11:58:32AM +0200, Michal Marek wrote:
>>> On 2015-10-01 10:19, Jani Nikula wrote:
>>>> On Thu, 01 Oct 2015, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>> Surprisingly kbuild can't cope with tristates in the
>>>>> <module>-$(CONFIG_FOO) pattern. This patch hacks up a solution.
>>>>
>>>> Given that it's two distinct Makefile variables (foo-y and foo-m) being
>>>> assigned to, I don't really find this surprising. Maybe this could be
>>>> made to work as a convenience, but there might be other, more surpising
>>>> consequences.
>>>
>>> I actually think that kbuild should be able to handle this. The likely
>>> reason why it is not doing it right now is that in an ideal world,
>>> modules are modules can be built out of tree against just the kernel and
>>> their static dependencies. In real world, we sometimes have features in
>>> modules that are enabled if other modules are enabled. I'll post a patch
>>> later. We also have lots of tests fo CONFIG_FOO || CONFIG_FOO_MODULE in
>>> built-in code, which is a similar case.
>>
>> Cool. I'll keep this hack in drm-misc then. Please cc me on the proper
>> solution so I know when I can revert it again.
> 
> It's not as trivial as it seemed, because there are at least three
> Makefiles that rely on the current behavior:
> 
> init/Makefile
> drivers/misc/ibmasm/Makefile
> fs/logfs/Makefile

drivers/usb/chipidea is also on the list.

Michal
