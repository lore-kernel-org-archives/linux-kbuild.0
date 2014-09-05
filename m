Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:64505 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932083AbaIEMOR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Sep 2014 08:14:17 -0400
MIME-Version: 1.0
In-Reply-To: <1409903718.11359.30.camel@ale.ozlabs.ibm.com>
References: <1409894927.11359.26.camel@ale.ozlabs.ibm.com>
	<20140905071344.GA16024@visitor2.iram.es>
	<1409903718.11359.30.camel@ale.ozlabs.ibm.com>
Date: Fri, 5 Sep 2014 08:14:16 -0400
Message-ID: <CA+5PVA4beW2Ttuyy-gNFG-+JQm9w9-nDQGSiYxmecW=sL1b26A@mail.gmail.com>
Subject: Re: [PATCH v2] deb-pkg: Add support for powerpc little endian
From: Josh Boyer <jwboyer@fedoraproject.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Gabriel Paubert <paubert@iram.es>, Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Leann Ogasawara <leann.ogasawara@canonical.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, Anton Blanchard <anton@samba.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Fri, Sep 5, 2014 at 3:55 AM, Michael Neuling <mikey@neuling.org> wrote:
> On Fri, 2014-09-05 at 09:13 +0200, Gabriel Paubert wrote:
>> On Fri, Sep 05, 2014 at 03:28:47PM +1000, Michael Neuling wrote:
>> > The Debian powerpc little endian architecture is called ppc64le.  This
>>
>> Huh? ppc64le or ppc64el?
>
> ppc64el.  Commit message is wrong.  Fixed below.

Yay!  Just like every other architecture, we continue to have the deb
based distros call it one thing, and the RPM based distros call it
another.  At least we're consistent in our inconsistency.

josh
