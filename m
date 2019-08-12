Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726681AbfHLWzV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 18:55:21 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190812182421.141150-4-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com> <20190812182421.141150-4-brendanhiggins@google.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream like string builder
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 12 Aug 2019 15:55:19 -0700
Message-Id: <20190812225520.5A67C206A2@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>

Quoting Brendan Higgins (2019-08-12 11:24:06)
> +void string_stream_clear(struct string_stream *stream)
> +{
> +       struct string_stream_fragment *frag_container, *frag_container_sa=
fe;
> +
> +       spin_lock(&stream->lock);
> +       list_for_each_entry_safe(frag_container,
> +                                frag_container_safe,
> +                                &stream->fragments,
> +                                node) {
> +               list_del(&frag_container->node);

Shouldn't we free the allocation here? Otherwise, if some test is going
to add, add, clear, add, it's going to leak until the test is over?

> +       }
> +       stream->length =3D 0;
> +       spin_unlock(&stream->lock);
> +}
> +
