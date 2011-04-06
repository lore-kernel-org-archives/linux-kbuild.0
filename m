Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50778 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752702Ab1DFHhl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Apr 2011 03:37:41 -0400
Message-ID: <4D9C1842.6000602@suse.cz>
Date: Wed, 06 Apr 2011 09:37:38 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 01/34] kconfig: Do not record timestamp in auto.conf and
 autoconf.h
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>	<1302015561-21047-2-git-send-email-mmarek@suse.cz> <BANLkTinwKzasKmB_fFzXd+W7F6GGuPO6+g@mail.gmail.com>
In-Reply-To: <BANLkTinwKzasKmB_fFzXd+W7F6GGuPO6+g@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 5.4.2011 20:57, Arnaud Lacombe wrote:
> Hi,
> 
> On Tue, Apr 5, 2011 at 10:58 AM, Michal Marek <mmarek@suse.cz> wrote:
>> Timestamps in file data are useless and there is already one in .config
>>
> hum, shouldn't this be tunable via KCONFIG_NOTIMESTAMP ? This might be
> useful to know when the file was generated, independently of the
> .config, as conf_write() and conf_write_autoconf() are independent
> from one another.

Yeah, but ls -l include/generated/autoconf.h will tell you the same,
won't it?

Michal
