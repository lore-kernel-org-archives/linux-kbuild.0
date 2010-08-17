Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:57589 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757315Ab0HQJDF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 05:03:05 -0400
Message-ID: <4C6A4FA2.80907@suse.cz>
Date: Tue, 17 Aug 2010 11:00:18 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] kbuild: `nconf' needs -lintl
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com> <1281932346-19067-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281932346-19067-3-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 16.8.2010 06:19, Arnaud Lacombe wrote:
> -HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses
> +HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses -lintl

This will not work on Linux though, the libintl functions are part of
glibc itself. There is already scripts/kconfig/check.sh and the
following snippet in scripts/kconfig/lkc.h

#ifndef KBUILD_NO_NLS
# include <libintl.h>
#else
static inline const char *gettext(const char *txt) { return txt; }
static inline void textdomain(const char *domainname) {}
static inline void bindtextdomain(const char *name, const char *dir) {}
#endif

that take care of disabling libintl support if it doesn't work. Not
optimal, but it should build in theory. Could you debug why it does not
work on NetBSD?

Michal
