Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46525 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753694AbbDIM6a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 08:58:30 -0400
Message-ID: <55267775.3080407@suse.cz>
Date: Thu, 09 Apr 2015 14:58:29 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] kconfig: Do not print status messages in make -s
 mode
References: <1428493376-20197-1-git-send-email-mmarek@suse.cz>	 <1428493376-20197-2-git-send-email-mmarek@suse.cz> <1428583676.14000.50.camel@x220>
In-Reply-To: <1428583676.14000.50.camel@x220>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org

On 2015-04-09 14:47, Paul Bolle wrote:
> On Wed, 2015-04-08 at 13:42 +0200, Michal Marek wrote:
>> Add an -s option to the conf, mconf, qconf and gconf frontends and pass
>> it when make -s is used.
> 
> Basically this suppresses everything except warning and errors,
> correct? 

Yes, that's what make -s is expected to do.


> I don't actually use nconf. Is it already silent?

Yes.


> (I had to look up $(kecho). I found:
>     ###
>     # Easy method for doing a status message
>            kecho := :
>      quiet_kecho := echo
>     silent_kecho := :
>     kecho := $($(quiet)kecho)
> 
> I'm not fluent in Makefilese. What does it provide beyond @echo?)

See Documentation/kbuild/makefiles.txt.


> The patch adds this :
>     conf_set_message_callback(NULL);
> 
> for conf, gconf, and qconf. That won't work for mconf?

Have you tried looking at the mconf code? It sets a message callback to
display ncurses dialogs.

Michal
