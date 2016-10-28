Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:37218 "EHLO
        lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1034087AbcJ1WJL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 18:09:11 -0400
Message-ID: <1477692545.2167.42.camel@tiscali.nl>
Subject: Re: [PATCH v2 1/5] kconfig: introduce the "imply" keyword
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sat, 29 Oct 2016 00:09:05 +0200
In-Reply-To: <alpine.LFD.2.20.1610272156050.14694@knanqh.ubzr>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org>
         <1477448931-29051-2-git-send-email-nicolas.pitre@linaro.org>
         <1477613871.2121.92.camel@tiscali.nl>
         <alpine.LFD.2.20.1610272156050.14694@knanqh.ubzr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2016-10-27 at 23:10 -0400, Nicolas Pitre wrote:
> On Fri, 28 Oct 2016, Paul Bolle wrote:
> > And in your example BAR is bool, right? Does the above get more
> > complicated if BAR would be tristate?
> 
> If BAR=m then implying BAZ from FOO=y will force BAZ to y or n, 
> bypassing the restriction provided by BAR like "select" does.  This is 
> somewhat questionable for "select" to do that, and the code emits a 
> warning when "select" bypasses a direct dependency set to n, but not 
> when set to m. For now "imply" simply tries to be consistent with 
> the "select" behavior.

Side note: yes, one can select a symbol that's missing one or more
dependencies. But since Kconfig has two separate methods to describe
relations (ie, selecting and depending) there's logically the
possibility of conflict. So we need a rule to resolve that conflict.
That rule is: "select" beats "depends on". I don't think that this rule
is less plausible than the opposite rule.


Paul Bolle
