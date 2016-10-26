Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:36832 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753809AbcJZXoH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Oct 2016 19:44:07 -0400
Received: by mail-qt0-f169.google.com with SMTP id 12so12242664qtm.3
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Oct 2016 16:44:06 -0700 (PDT)
Date: Wed, 26 Oct 2016 19:44:04 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 1/5] kconfig: introduce the "imply" keyword
In-Reply-To: <1477524527.2121.15.camel@tiscali.nl>
Message-ID: <alpine.LFD.2.20.1610261930260.14694@knanqh.ubzr>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org> <1477448931-29051-2-git-send-email-nicolas.pitre@linaro.org> <1477524527.2121.15.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 27 Oct 2016, Paul Bolle wrote:

> On Tue, 2016-10-25 at 22:28 -0400, Nicolas Pitre wrote:
> > SUBSYSTEM_X can still be configured out, and it can be set as a 
> > module when none of the drivers are selected or all of them are also 
> > modular.
> 
> Short note, to highlight a pet peeve: "select" (and therefor
> "selected") has a special meaning in kconfig land. I guess you meant
> something neutral like "set" here. Is that correct?

Right. Will fix.

> By the way: "also" makes this sentence hard to parse.

s/also //


Nicolas
