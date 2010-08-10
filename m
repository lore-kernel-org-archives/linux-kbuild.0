Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54332 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753166Ab0HJGnU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Aug 2010 02:43:20 -0400
MIME-Version: 1.0
In-Reply-To: <20100805222623.39A3240208@magilla.sf.frob.com>
References: <AANLkTim2mi0wbJJl17OkbCJbRt-s5phR4sumn5GsJKUp@mail.gmail.com>
	<20100621120613.86cad1a4.akpm@linux-foundation.org>
	<4C1FC35C.8090201@suse.cz>
	<AANLkTil2-YNAa-jyOYD4cNtbJQ1XQJ6-v3iJ6wxpz7br@mail.gmail.com>
	<AANLkTinC6Sqs7W--=14nmJFDcTS4HQn0=ysn7VhYDDX6@mail.gmail.com>
	<adaocdg3fng.fsf@roland-alpha.cisco.com>
	<20100805222623.39A3240208@magilla.sf.frob.com>
Date: Tue, 10 Aug 2010 08:43:18 +0200
Message-ID: <AANLkTikvRqTR6TjP9H4-_RHhax24YRPv9PCxn165RTWs@mail.gmail.com>
Subject: Re: [PATCH] Fix CONFIG_CROSS_COMPILE issue in .config
From: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Cc: Roland Dreier <rdreier@cisco.com>, Tiago Maluta <tiago.maluta@gmail.com>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, Aug 6, 2010 at 12:26 AM, Roland McGrath <roland@redhat.com> wrote:
>> Yes, this make sense to me.  It's not clear to me why we ever needed
>> the conditional assignment of an empty CROSS_COMPILE (that code predates
>> the start of git history) [...]
>
> Perhaps someone used make --warn-undefined-variables.

Are there any other comments or is the patch valid? Should I resend it
as a new thread?

Regards,
Yegor
