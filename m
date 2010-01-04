Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.211.176]:43720 "EHLO
	mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752878Ab0ADIew convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2010 03:34:52 -0500
Received: by ywh6 with SMTP id 6so15133007ywh.4
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Jan 2010 00:34:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87skanp8ln.fsf@macbook.be.48ers.dk>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	<1261446643-21714-4-git-send-email-ptyser@xes-inc.com> <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
	<20091231224439.AF5353F6D1@gemini.denx.de> <1262301038.29396.137.camel@localhost.localdomain>
	<20100101104449.6DAC63F6FF@gemini.denx.de> <87wrzzpq8c.fsf@macbook.be.48ers.dk>
	<20100103095032.8F05AE34A26@gemini.denx.de> <87skanp8ln.fsf@macbook.be.48ers.dk>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 4 Jan 2010 01:34:32 -0700
Message-ID: <fa686aa41001040034i22703ab5s6ac0e1fc8ff6b000@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT
	uImages
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Wolfgang Denk <wd@denx.de>, Peter Tyser <ptyser@xes-inc.com>, linux-kbuild@vger.kernel.org, linuxppc-dev@ozlabs.org

On Sun, Jan 3, 2010 at 7:27 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Wolfgang" == Wolfgang Denk <wd@denx.de> writes:
>
> Hi,
>
>  >> No, that would break stuff for the existing users. The existing format
>  >> make/file names shouldn't change.
>
>  Wolfgang> Well, with this argument you can block all progress and freeze all
>  Wolfgang> development to some ancient state.
>
> We only break backwards compatibility when we have to. There's no
> technical reason for renaming the existing make targets.

I agree, and I feel pretty strongly on this point.  The meaning of the
uImage target should not change.  The new format must use a different
target name.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
