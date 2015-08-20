Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:34943 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543AbbHTJ44 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 05:56:56 -0400
MIME-Version: 1.0
In-Reply-To: <20150819190935.GA8443@milliways>
References: <1439967036-18297-1-git-send-email-daniel.baluta@intel.com>
	<20150819190935.GA8443@milliways>
Date: Thu, 20 Aug 2015 12:56:55 +0300
Message-ID: <CAEnQRZBxT8cZdiZa4hYpbAxKsxbZ_jniJHeWwefgDuTTCzLc+A@mail.gmail.com>
Subject: Re: [PATCH] scripts: Extract kernel headers for out of tree modules build
From: Daniel Baluta <daniel.baluta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ken Moffat <zarniwhoop@ntlworld.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "octavian.purdila@intel.com" <octavian.purdila@intel.com>, bogdan.m.davidoaia@intel.com

On Wed, Aug 19, 2015 at 10:09 PM, Ken Moffat <zarniwhoop@ntlworld.com> wrote:
> On Wed, Aug 19, 2015 at 09:50:36AM +0300, Daniel Baluta wrote:
>> scripts/package/builddeb already creates a linux-keader .deb
>> package, but we need this feature also for non-Debian distros
>> (e.g. Android or LFS).
>>
>> Signed-off-by: Daniel Baluta <daniel.baluta@intel.com>
>
> In general, LFS does not need this - but obviously we give you the
> freedom to change whatever you do ("your system, your rules").
>
> In particular, we assume that you will build on the machine where
> the kernel will run, and also that you may need to rebuild the kernel
> several times (for additional .config choices) depending on what
> parts of BLFS you build.  And we do not provide a package manager.
> So I submit that we are the people least likely to need this.
>
> ĸen

Hi Ken / Michal,

While I don't see a huge problem having this script inside the kernel sources, I
agree that we can push this to the distro packaging scripts.

Thanks a lot for your feedback ;).

Daniel.
