Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews02.kpnxchange.com ([213.75.39.5]:62689 "EHLO
	cpsmtpb-ews02.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750831AbaLTKO5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Dec 2014 05:14:57 -0500
Message-ID: <1419070495.26428.15.camel@x220>
Subject: Re: arch/x86/kernel/cpu/mkcapflags.sh
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sat, 20 Dec 2014 11:14:55 +0100
In-Reply-To: <20141219174330.GC2286@localhost.localdomain>
References: <20141219174330.GC2286@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Sylvain,

Why did you send this to linux-kbuild? It seems this is only interesting
to the people (and lists) found with
        scripts/get_maintainer.pl -f arch/x86/kernel/cpu/mkcapflags.sh

On Fri, 2014-12-19 at 18:43 +0100, Sylvain BERTRAND wrote:
> line 30:
> [ "$VALUE" == '""' ] && continue
> 
> should be
> 
> [ "$VALUE" = '""' ] && continue

If you resend this to the x86 people you might want to add an
_explanation_ for that suggestion. And the chances of someone looking at
it increase if you submit it as a proper patch.


Paul Bolle

