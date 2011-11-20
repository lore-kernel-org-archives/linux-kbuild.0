Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33955 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751447Ab1KTNYe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Nov 2011 08:24:34 -0500
Message-ID: <4EC8FF93.7010706@suse.cz>
Date: Sun, 20 Nov 2011 14:24:35 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Fix checking return value of 'fwrite'
References: <87lisype1v.fsf@faui43f.informatik.uni-erlangen.de> <CACqU3MWZuqgpxG7FSvr2LkqTqwF-gQM8hQSnTTpHpcWT2LHGNA@mail.gmail.com>
In-Reply-To: <CACqU3MWZuqgpxG7FSvr2LkqTqwF-gQM8hQSnTTpHpcWT2LHGNA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Reinhard Tartler <Reinhard.Tartler@informatik.uni-erlangen.de>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, Jean Sacren <sakiwit@gmail.com>, linux-kernel@vger.kernel.org, vamos-dev@lists.informatik.uni-erlangen.de

On 7.10.2011 05:29, Arnaud Lacombe wrote:
> Hi,
> 
> 2011/10/6 Reinhard Tartler <Reinhard.Tartler@informatik.uni-erlangen.de>:
>> fwrite indicates '1' written member if a zero-length string is written.
> you forgot the "Signed-off-by: " part :)

Reinhard, can I assume

Signed-off-by: Reinhard Tartler
<Reinhard.Tartler@informatik.uni-erlangen.de>

? The patch is otherwise correct.

Michal
