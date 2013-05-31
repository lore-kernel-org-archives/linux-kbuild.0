Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jdl.com ([208.123.74.7]:40612 "EHLO jdl.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751271Ab3EaNuS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 May 2013 09:50:18 -0400
Message-Id: <E1UiOxz-0004ET-RE@jdl.com>
Subject: Re: DTB build failure due to preproccessing
In-reply-to: <20130531114824.60D223E0901@localhost>
References: <1369996170.5199.68.camel@zakaz.uk.xensource.com> <20130531114824.60D223E0901@localhost>
Date: Fri, 31 May 2013 08:01:59 -0500
From: Jon Loeliger <jdl@jdl.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Ian Campbell <Ian.Campbell@citrix.com>, linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, linux-kbuild@vger.kernel.org

> >         
> > Line 374 is the "IDSEL 0x16..." line here:
> > 			interrupt-map = <
> > 				/* IRQ mapping for pci slots and ALI M1533
> > 				 ...
> > 				 * management core also isn't used.
> > 				 */
> > 
> > 				/* IDSEL 0x16 / dev=6, bus=0 / PCI slot 3 */
> > 				0x3000 0 0 1 &xps_intc_0 3 2
> > 				0x3000 0 0 2 &xps_intc_0 2 2
> > 				0x3000 0 0 3 &xps_intc_0 5 2
> > 				0x3000 0 0 4 &xps_intc_0 4 2

Can you show me the original source without mods here, please?
Or is the "..." purely elided comments?

> > Which gets preprocessed into:
> >            interrupt-map = <
> >         # 375 "arch/powerpc/boot/dts/virtex440-ml510.dts"
> >             0x3000 0 0 1 &xps_intc_0 3 2
> >             0x3000 0 0 2 &xps_intc_0 2 2
> >             0x3000 0 0 3 &xps_intc_0 5 2
> >             0x3000 0 0 4 &xps_intc_0 4 2


> dtc is only able to track line numbers when the native /include/
> directive is used. The #include directive doesn't help it. It should be
> added, but until it is the following patch solves the problem:

It's supposed to do better than that, I think.
This, from dtc-lexer.l

<*>^"#"(line)?{WS}+[0-9]+{WS}+{STRING}({WS}+[0-9]+)? {
                        char *line, *tmp, *fn;
                        /* skip text before line # */
                        line = yytext;
                        while (!isdigit(*line))
                                line++;
                        /* skip digits in line # */
                        tmp = line;
                        while (!isspace(*tmp))
                                tmp++;
                        /* "NULL"-terminate line # */
                        *tmp = '\0';
                        /* start of filename */
                        fn = strchr(tmp + 1, '"') + 1;
                        /* strip trailing " from filename */
                        tmp = strchr(fn, '"');
                        *tmp = 0;
                        /* -1 since #line is the number of the next line */
                        srcpos_set_line(xstrdup(fn), atoi(line) - 1);
                }

Hrm.  Is this a "that's not in the kernel's copy yet" problem?
Or did this fail to match the offending '# <line> <file>' somehow?
(Like, is that '# 375' really in column 1?)

Thanks,
jdl
