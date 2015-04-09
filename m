Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud6.xs4all.net ([194.109.24.31]:52095 "EHLO
	lb3-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755654AbbDIO6L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 10:58:11 -0400
Message-ID: <1428591484.14000.69.camel@x220>
Subject: Re: [PATCH 2/2] kconfig: Do not print status messages in make -s
 mode
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 09 Apr 2015 16:58:04 +0200
In-Reply-To: <55267775.3080407@suse.cz>
References: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
		 <1428493376-20197-2-git-send-email-mmarek@suse.cz>
	 <1428583676.14000.50.camel@x220> <55267775.3080407@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Thu, 2015-04-09 at 14:58 +0200, Michal Marek wrote:
> On 2015-04-09 14:47, Paul Bolle wrote:
> > The patch adds this :
> >     conf_set_message_callback(NULL);
> > 
> > for conf, gconf, and qconf. That won't work for mconf?
> 
> Have you tried looking at the mconf code? It sets a message callback to
> display ncurses dialogs.

I see.

mconf sets that callback after it has already done a few things. So
"make -s menuconfig" without a .config will do
    main()
        conf_read(NULL)
            conf_read_simple([...])
                conf_message(_("using defaults found in %s"), [...])
                     conf_message_callback()

and at that point conf_message_callback() still points to
conf_default_message_callback(). This default uses stdout. So I think I
stumbled on a cornercase where one message still can be printed to
stdout. Shocking!

Neither conf nor gconf or qconf (assuming GTK and Qt are silent, that
is) seem to do anything serious before setting that callback, so I don't
expect there to be more messages that can break the silence.

Thanks,


Paul Bolle

