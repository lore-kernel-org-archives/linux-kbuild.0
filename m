Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56786 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754450Ab3ALVY4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Jan 2013 16:24:56 -0500
Message-ID: <50F1D491.5020101@suse.cz>
Date: Sat, 12 Jan 2013 22:24:33 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] modpost: Add flag -f for making section mismatches fatal
References: <1356029364-11346-1-git-send-email-kliegs@chromium.org> <87ip7f5ecu.fsf@rustcorp.com.au> <50E54A14.5010909@suse.cz> <CAPQV+nOTEfeQVwqd8zAP37qS3PrdwFQv1c0AC=nAz3UCemXhSg@mail.gmail.com>
In-Reply-To: <CAPQV+nOTEfeQVwqd8zAP37qS3PrdwFQv1c0AC=nAz3UCemXhSg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Kliegman <kliegs@chromium.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, linux-kbuild@vger.kernel.org

On 3.1.2013 22:39, Jonathan Kliegman wrote:
> I'm not sure what you mean about configs failing.  After adding this
> option to init/Kconfig I was able to build fine using old and new
> configs with and without the option set.  Is there something specific
> you'd like me to test for?

We still have section mismatches in allmodconfig. With a Kconfig option
to make them fatal, allmodconfig would select it and fail.

Michal
