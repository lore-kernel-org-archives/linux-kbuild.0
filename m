Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46400 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbcKGWb6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 17:31:58 -0500
Date: Mon, 7 Nov 2016 14:31:49 -0800
From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH v3 2/4] kconfig: regenerate *.c_shipped files after
 previous changes
Message-ID: <20161107223149.pgs5dqtbw5aprow7@jtriplet-mobl2.jf.intel.com>
References: <1478556899-2951-1-git-send-email-nicolas.pitre@linaro.org>
 <1478556899-2951-3-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478556899-2951-3-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Michal Marek <mmarek@suse.com>, Richard Cochran <richardcochran@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Thomas Gleixner <tglx@linutronix.de>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

[snipping large patch]

One suggestion that might make this patch easier to review: you might
consider first regenerating the unchanged parser with Bison 3.0.4, then
regenerating it again after the "imply" change.  I think that'd
eliminate quite a lot of noise in this patch.

- Josh Triplett
