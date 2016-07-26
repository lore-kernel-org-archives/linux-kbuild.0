Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48732 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756109AbcGZUkH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 16:40:07 -0400
Subject: Re: Officially vetted programming languages
References: <CACVxJT-YRukBirLwzeiC0agZurR28J7u2EdNo9QjQTEN_C3x8w@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5797CA9D.1090803@suse.com>
Date: Tue, 26 Jul 2016 22:39:57 +0200
MIME-Version: 1.0
In-Reply-To: <CACVxJT-YRukBirLwzeiC0agZurR28J7u2EdNo9QjQTEN_C3x8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Dne 25.7.2016 v 15:11 Alexey Dobriyan napsal(a):
> Do I understand correctly that POSIX sh and GNU make are
> the only acceptable languages in kernel build

Also sed, awk and bc. Perl is required to some extent (by
headers_install and some arch drivers). Plus ia64 has a python script.
But you would need to provide a compelling reason for introducing
another build dependency.

Michal

