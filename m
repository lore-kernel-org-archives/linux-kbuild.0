Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43826 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbeJRDWO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 23:22:14 -0400
Date: Wed, 17 Oct 2018 21:25:02 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Add -Wshadow to sparse
Message-ID: <20181017192501.3yqfq77q2n4xdq7l@ltop.local>
References: <20181017170554.18841-1-bigeasy@linutronix.de>
 <20181017170554.18841-2-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017170554.18841-2-bigeasy@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

On Wed, Oct 17, 2018 at 07:05:52PM +0200, Sebastian Andrzej Siewior wrote:
> I remember that `sparse' used to warn about shadowed variables but it
> seems not to do it by default anymore. It was useful.
> 
> Enable `-Wshadow' while invoking sparse.

Hi,

I made a quick test and I saw it would add a lot of noise because of
(valid) warnings coming from macros using a statement expression
redeclaring variables like '__u', 'tmp', ...

BTW, as far as I can see, sparse never had it enabled by default.

Kind regards,
-- Luc Van Oostenryck
