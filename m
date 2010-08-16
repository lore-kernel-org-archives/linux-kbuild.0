Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vpn.id2.novell.com ([195.33.99.129]:41323 "EHLO
	vpn.id2.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263Ab0HPMNC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 08:13:02 -0400
Message-Id: <4C6942D102000078000100C9@vpn.id2.novell.com>
Date: Mon, 16 Aug 2010 12:53:21 +0100
From: "Jan Beulich" <JBeulich@novell.com>
Subject: Re: [PATCH] fixes for using make 3.82
References: <4C6936120200007800010064@vpn.id2.novell.com>
 <20100816114131.GA7122@merkur.ravnborg.org>
In-Reply-To: <20100816114131.GA7122@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Andrew Benton <b3nton@gmail.com>, linux-kernel@vger.kernel.org

>>> On 16.08.10 at 13:41, Sam Ravnborg <sam@ravnborg.org> wrote:
> Added: Michael Marek (kbuild maintainer) + linux-kbuild.
> 
> I assume this fixes firmware build reported by Andrew Benton (cc:ed).

Yes, it does (I had observed the same, which prompted the fix).

Jan

