Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f220.google.com ([209.85.219.220]:65521 "EHLO
	mail-ew0-f220.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753137Ab0CGN5b convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Mar 2010 08:57:31 -0500
MIME-Version: 1.0
In-Reply-To: <20100303094947.GB15480@sepie.suse.cz>
References: <1267545472-17131-1-git-send-email-jkacur@redhat.com>
	 <20100303094947.GB15480@sepie.suse.cz>
Date: Sun, 7 Mar 2010 14:57:29 +0100
Message-ID: <520f0cf11003070557m1eed4545yc990d7ed29277c46@mail.gmail.com>
Subject: Re: [PATCH] kbuild - tags
From: John Kacur <jkacur@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, Mar 3, 2010 at 10:49 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Tue, Mar 02, 2010 at 04:57:52PM +0100, John Kacur wrote:
>>       - Add the ability to make tags for all archs using "all"
>>               make ALLSOURCE_ARCHS=all tags
>>       - Document this in kbuild.txt
>>
>>       Without this change you have to type each arch separately.
>>
>> Signed-off-by: John Kacur <jkacur@redhat.com>
>
> Thanks, applied.
>

Great! Are you going to send a pull request to Linus soon for 2.6.34?

Thanks
John
