Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33063 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbcKPAsS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Nov 2016 19:48:18 -0500
Received: by mail-oi0-f48.google.com with SMTP id 128so44738218oih.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Nov 2016 16:48:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1478841010-28605-7-git-send-email-nicolas.pitre@linaro.org>
References: <1478841010-28605-1-git-send-email-nicolas.pitre@linaro.org> <1478841010-28605-7-git-send-email-nicolas.pitre@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 15 Nov 2016 16:48:17 -0800
Message-ID: <CALAqxLW2KE8FwTzPJDhTA3x1gKTfoaCH5Vw=ZPr8tp3Y1VsD4A@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] posix-timers: make it configurable
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, Richard Cochran <richardcochran@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Thu, Nov 10, 2016 at 9:10 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> Some embedded systems have no use for them.  This removes about
> 25KB from the kernel binary size when configured out.
>
> Corresponding syscalls are routed to a stub logging the attempt to
> use those syscalls which should be enough of a clue if they were
> disabled without proper consideration. They are: timer_create,
> timer_gettime: timer_getoverrun, timer_settime, timer_delete,
> clock_adjtime, setitimer, getitimer, alarm.
>
> The clock_settime, clock_gettime, clock_getres and clock_nanosleep
> syscalls are replaced by simple wrappers compatible with CLOCK_REALTIME,
> CLOCK_MONOTONIC and CLOCK_BOOTTIME only which should cover the vast
> majority of use cases with very little code.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> Reviewed-by: Josh Triplett <josh@joshtriplett.org>
> Acked-by: Richard Cochran <richardcochran@gmail.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>

Ok.. ran the series through the kselftest/timers series and the results look ok.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
