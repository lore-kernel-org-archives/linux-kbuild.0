Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34742 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753123AbbCRIcV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 04:32:21 -0400
Message-ID: <55093812.6030300@suse.cz>
Date: Wed, 18 Mar 2015 09:32:18 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v1 kbuild for-next 1/2] makefiles: add config option to
 force all cc warnings to errors
References: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com> <1426633120.15575.17.camel@x220>
In-Reply-To: <1426633120.15575.17.camel@x220>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Jonathan Toppins <jtoppins@cumulusnetworks.com>
Cc: linux-kbuild@vger.kernel.org

On 2015-03-17 23:58, Paul Bolle wrote:
> Feel free to fix as many build warning as you can. I'd really appreciate
> that. But my x86_64 build of v4.0-rc4 is _almost_ warning free. And
> that's nice. And I find -Werror (and littering Makefiles with
> cc-disable-warning) just to remove the few warnings I still see plain
> silly. I'm sure the same holds for other people and their builds too. 

In addition to what Paul wrote, to review and fix warnings, it's IMO
much more practical to grep the build logs than have the build stop at
the first warning encountered.

Michal
