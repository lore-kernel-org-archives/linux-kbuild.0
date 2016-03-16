Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud2.xs4all.net ([194.109.24.25]:55320 "EHLO
	lb2-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752308AbcCPMmB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 08:42:01 -0400
Message-ID: <1458132116.2631.7.camel@tiscali.nl>
Subject: Re: [PATCH 1/2] kconfig: add chomp like helper function
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 16 Mar 2016 13:41:56 +0100
In-Reply-To: <56E946A1.2060400@suse.com>
References: <1458125619-28093-1-git-send-email-pebolle@tiscali.nl>
	 <56E946A1.2060400@suse.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On wo, 2016-03-16 at 12:42 +0100, Michal Marek wrote:
> For this particular use, it's probably easier to just write
> 
> conf_warning("unexpected data: %.*s",
> 	     (int)strcspn(line, "\r\n"), line);

OK. (Next time I'll try listen to the voice in my head whispering:
"There must be an easier way to do this.".)

> Or do you see more use cases for the chomp function?

No.

> No matter how the string is constructed, I like the verbose warning :)

I'll respin and resend (in a few hours).

Thanks,


Paul Bolle
