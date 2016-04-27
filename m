Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud6.xs4all.net ([194.109.24.24]:36244 "EHLO
	lb1-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750867AbcD0TUW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2016 15:20:22 -0400
Message-ID: <1461784817.21886.5.camel@tiscali.nl>
Subject: Re: [PATCH v2] kconfig: add unexpected data itself to warning
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 27 Apr 2016 21:20:17 +0200
In-Reply-To: <1458160047-8292-1-git-send-email-pebolle@tiscali.nl>
References: <1458160047-8292-1-git-send-email-pebolle@tiscali.nl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michal,

On wo, 2016-03-16 at 21:27 +0100, Paul Bolle wrote:
> If the .config parser runs into unexpected data it emits warnings
> like:
>     .config:6911:warning: unexpected data
> 
> Add the unexpected data itself to this warning. That makes it easier to
> discover what is actually going wrong:
>      .config:6911:warning: unexpected data: CONFOG_CHARGER_TPS65217=m
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> This v2 uses strcspn, as Michal suggesed. That turns a two patch series into a
> more elegant oneliner. It apparently pays off to know what string.h has to
> offer!

Nothing happened after I sent v2, as far as I can tell. Did this
oneliner fall through the cracks? 

Thanks,


Paul Bolle
