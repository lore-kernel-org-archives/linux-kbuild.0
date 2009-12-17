Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sj-iport-5.cisco.com ([171.68.10.87]:39444 "EHLO
	sj-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752636AbZLQGR1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 01:17:27 -0500
From: Roland Dreier <rdreier@cisco.com>
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org>
	<adabphy750b.fsf@roland-alpha.cisco.com> <4B29A686.9070603@redhat.com>
	<ada3a3a6xs6.fsf@roland-alpha.cisco.com> <4B29BA13.7020502@redhat.com>
	<aday6l25gnm.fsf@roland-alpha.cisco.com>
	<20091217054524.GA3931@merkur.ravnborg.org>
	<4B29C81E.2000704@zytor.com>
Date: Wed, 16 Dec 2009 22:17:26 -0800
In-Reply-To: <4B29C81E.2000704@zytor.com> (H. Peter Anvin's message of "Wed,
	16 Dec 2009 21:56:46 -0800")
Message-ID: <adatyvq5dl5.fsf@roland-alpha.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masami Hiramatsu <mhiramat@redhat.com>, Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>


 > +# Avoid funny character set dependencies
 > +LC_ALL=
 > +LC_CTYPE=C
 > +LC_COLLATE=C
 > +LC_NUMERIC=C
 > +export LC_ALL LC_CTYPE LC_COLLATE LC_NUMERIC

Yes, this plus my first patch (only touching the awk script, not the
Makefile) make sense to me.
